# coding=utf8

from scrapy.selector import Selector
from base_spider import BaseSpider
from mzhan.login import is_login,login,cookielib
import scrapy
import copy
import time
from mzhan.items import MzhanItem
import  requests,json

class MZhanSpider(BaseSpider):

    name = 'mzhan'

    start_urls = [
        'http://www.missevan.com'
    ]
    host_url = 'http://www.missevan.com'
    audio_host = 'http://static.missevan.com/'
    uid_prefix = '9999'
    def start_requests(self):
        if not is_login():
            login()
        for url in self.start_urls:
            yield scrapy.Request(
                url=url,
                cookies=cookielib.LWPCookieJar(filename='mzhan_cookies'),
                callback=self.parse_category,
                errback=self.handle_error
            )

    def parse_category(self, response):
        metadata = {}
        sel = Selector(response)
        category = sel.xpath(
            '//div[@class="vw-topcatalog-container"]//div[@class="vw-topcatalog-item fc-topcatalog-item"]')
        for sub_category in category:
            c_1 = sub_category.xpath('./a/@title').extract()
            sub = sub_category.xpath('./div/a')
            # print c_1[0]
            if c_1:
                metadata['audio_category_first']=c_1[0]
            for node in sub:
                url = node.xpath('./@href').extract()

                if url:
                    full_url = self.host_url + url[0]
                    c_2 = node.xpath('./@title').extract()
                    # print '    ', url[0]
                    # print '    ', c_2[0]
                    if c_2:
                        metadata['audio_category_last']=c_2[0]
                    m = copy.deepcopy(metadata)
                    yield scrapy.Request(
                        url=full_url,
                        meta={'audiodata':m},
                        cookies=cookielib.LWPCookieJar(filename='mzhan_cookies'),
                        callback=self.parse_page,
                        errback=self.handle_error,
                        priority=3
                    )
                    break

    def parse_page(self, response):
        metadata = response.meta['audiodata']
        model_url = 'http://www.missevan.com/sound/m?id=%s&p=%s'
        sel = Selector(response)
        category_id = response.url.split('/')[-1]
        total = 0
        page_sum_node = sel.xpath('//li[@class="last"]/a/@href').extract()
        if page_sum_node:
            total = page_sum_node[0].split('=')[-1]
            print response.url
        if total != 0:
            for p in range(1,int(total)+1):
                url = model_url % (category_id, p)
                m = copy.deepcopy(metadata)
                yield scrapy.Request(
                    url=url,
                    meta={'audiodata': m},
                    cookies=cookielib.LWPCookieJar(filename='mzhan_cookies'),
                    callback=self.parse_cover_title,
                    errback=self.handle_error,
                    priority=5
                )
                break

    def parse_cover_title(self, response):
        metadata = response.meta['audiodata']
        sel = Selector(response)
        nodes = sel.xpath('//div[@class="vw-subcatalog-contant fc-leftcontent-block floatleft"]/div/a')
        print response.url
        for node in nodes:
            url = node.xpath('./@href').extract()
            if url:
                url = self.host_url+url[0].strip()
                print url
                title = node.xpath('./@title').extract()
                if title:
                    title = title[0].strip()
                cover_image = node.xpath('./div[@class="vw-frontsound-image floatleft"]/img/@data-original').extract()
                if cover_image:
                    cover_image = cover_image[0]
                audio_duration = node.xpath('./div[@class="vw-frontsound-image floatleft"]/div[contains(@class,"vw-frontsound-time fc-hoverheight fc-hoverheight-music")]/text()').extract()
                audio_seconds = 0
                if audio_duration:
                    audio_duration = audio_duration[0]
                    temp_duration = audio_duration.split(':')
                    audio_seconds = int(temp_duration[0])*60+int(temp_duration[1])
                play_times = node.xpath('./div[3]/div[1]/text()').extract()
                if play_times:
                    play_times = ''.join(play_times).strip('\n ')
                likes = node.xpath('./div[3]/div[2]/text()').extract()
                if likes:
                    likes = ''.join(likes).strip('\n ')

                metadata['audio_cover_image'] = cover_image
                metadata['audio_name'] = title
                metadata['audio_duration'] = audio_seconds
                m = copy.deepcopy(metadata)
                yield scrapy.Request(
                    url=url,
                    meta={'audiodata': m},
                    cookies=cookielib.LWPCookieJar(filename='mzhan_cookies'),
                    callback=self.parse_details,
                    errback=self.handle_error,
                    priority=10
                )
                break

    def parse_details(self, response):

        metadata = response.meta['audiodata']
        metadata['main_url'] = response.url
        sound_id = response.url.split('/')[-1]
        json_url = 'http://www.missevan.com/sound/getsoundlike?type=7&sound_id=%s' % sound_id
        data = None
        print ' json_url    ============',json_url
        print sound_id
        data = json.loads(requests.get(json_url).text)

        if data:
            albums = None
            try:
                albums = data['successVal']['albums'][0]
            except Exception as e:
                print e
            if albums:
                albums_id = self.uid_prefix + str(albums['id'])
                albums_name = albums['title']
                albums_create_time = albums['create_time']
                albums_create_user_id = self.uid_prefix + str(albums['user_id'])
                albums_cover_image = albums['front_cover']
                albums_last_update_time = albums['last_update_time']
                metadata['album_id'] = albums_id
                metadata['album_name'] = albums_name
                metadata['album_create_time'] = self.getTime(albums_create_time)
                metadata['album_update_time'] = self.getTime(albums_last_update_time)
                metadata['album_create_user_id'] = albums_create_user_id
                metadata['album_cover_image'] = albums_cover_image


        sound_url = 'http://www.missevan.com/sound/getsound?soundid=%s' % sound_id
        print 'sound_url=======',sound_url
        sound_info = None
        try:
            sound_info = json.loads(requests.get(url=sound_url).text)
        except Exception as e:
            print e
        sound = None
        try:
            sound = sound_info['info']['sound']
        except Exception as e:
            print e
        user = None
        try:
            user = sound_info['info']['user']
        except Exception as e:
            print e
        tags = None
        try:
            tags = sound_info['info']['tags']
        except Exception as e:
            print e
        if tags:
            for tag in tags:
                pass
        try:
            upper_id = self.uid_prefix + str(user['id'])
            metadata['upper_id'] = upper_id
        except Exception as e:
            print e
        try:
            upper_introduce = user['intro']
            metadata['upper_introduce'] = upper_introduce
        except Exception as e:
            print e
        try:
            upper_name = user['username']
            metadata['upper_name'] = upper_name
        except Exception  as e:
            print e
        try:
            upper_head_image = user['icon']
            metadata['upper_head_image'] = upper_head_image
        except Exception as e:
            print e
        try:
            audio_create_time = sound['create_time']
            metadata['audio_create_time'] = self.getTime(audio_create_time)
        except Exception as e:
            print e
        try:
            audio_introduce = sound['intro']
            metadata['audio_introduce'] = audio_introduce
        except Exception as e:
            print e
        try:
            audio_cover_image = sound['front_cover']
            metadata['audio_cover_image'] = audio_cover_image
        except Exception as e:
            print e
        try:
            metadata['audio_mp3_url_low'] = self.audio_host+sound['soundurl_32']
        except Exception as e:
            print e

        try:
            metadata['audio_mp3_url_middle'] = self.audio_host + sound['soundurl_64']
        except Exception as e:
            print e
        try:
            metadata['audio_mp3_url_high'] = self.audio_host + sound['soundurl_128']
        except Exception as e:
            print e
        try:
            metadata['audio_id'] = self.uid_prefix + str(sound['id'])
        except Exception as e:
            print e
        try:
            metadata['audio_play_times'] = sound['view_count']
        except Exception as e:
            print e
        try:
            metadata['audio_comment_sum'] = sound['comment_count']
        except Exception as e:
            print e
        try:
            metadata['audio_points'] = sound['point']
        except Exception as e:
            print e
        try:
            metadata['audio_uptimes'] = sound['uptimes']
        except Exception as e:
            print e
        item = MzhanItem()
        for key, value in metadata.items():
            item[key] = value
        yield item


    @classmethod
    def getTime(cls,timestr):
        try:
            time_local = time.localtime(float(timestr))
            return time.strftime("%Y-%m-%d", time_local)
        except Exception as e:
            print '-      ------',e
            return timestr