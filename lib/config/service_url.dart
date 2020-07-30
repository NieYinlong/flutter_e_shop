// 正式服
const baseUrl = 'https://www.fastmock.site/mock/cdd7f4392d9a84bcabda1cdef02cc719/eshop';

// 测试服
// const baseUrl = 'https://www.fastmock.test.site/mock/cdd7f4392d9a84bcabda1cdef02cc719/eshop';

// const servicePath = {
//   'homeBanner': '$baseUrl/home_banner',
//   'homeData': '$baseUrl/homeData', // 首页信息
//   'hotSale' : '$baseUrl/hotSale',  // 首页下面的热卖列表
// };

class API {
  static const HOME_BANNER = '$baseUrl/home_banner';
  static const HOME_DATA = '$baseUrl/homeData';
  static const HOT_SALE = '$baseUrl/hotSale';
}

