import 'package:z_mart/features/personalization/models/user_model.dart';
import 'package:z_mart/features/shop/models/category_model.dart';
import 'package:z_mart/utils/constants/image_strings.dart';

import '../features/shop/models/banner_model.dart';
import '../routes/routes.dart';

class DummyData {
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: ZImages.banner1, targetScreen: ZRoutes.order, active: true),
    BannerModel(
        imageUrl: ZImages.banner2, targetScreen: ZRoutes.order, active: true),
    BannerModel(
        imageUrl: ZImages.banner3, targetScreen: ZRoutes.order, active: true)
  ];

  /// User
  static final UserModel user = UserModel(
      id: '163695',
      firstName: 'Zion',
      lastName: 'Mezba',
      username: 'zionmezba',
      email: 'mezbazion@gmail.com',
      phoneNumber: '01750458479',
      profilePicture: '');

  /// Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: ZImages.sportIcon, image: 'Sports', isFeatured: true),
    CategoryModel(
        id: '3',
        name: ZImages.furnitureIcon,
        image: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '5',
        name: ZImages.electronicsIcon,
        image: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '4', name: ZImages.clothIcon, image: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '2', name: ZImages.toyIcon, image: 'Toys', isFeatured: true),
    CategoryModel(
        id: '8', name: ZImages.shoeIcon, image: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '9',
        name: ZImages.cosmeticsIcon,
        image: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '10',
        name: ZImages.jeweleryIcon,
        image: 'Jewelery',
        isFeatured: true),

    //Sub category
    CategoryModel(
        id: '6',
        name: 'Sport Shoes',
        image: ZImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '11',
        name: 'Sport Equipments',
        image: ZImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '7',
        name: 'Track Suits',
        image: ZImages.sportIcon,
        isFeatured: false,
        parentId: '1'),
    //Furniture
    CategoryModel(
        id: '12',
        name: 'Bedroom Furniture',
        image: ZImages.furnitureIcon,
        isFeatured: false,
        parentId: '3'),
    CategoryModel(
        id: '13',
        name: 'Kitchen Furniture',
        image: ZImages.furnitureIcon,
        isFeatured: false,
        parentId: '3'),
    CategoryModel(
        id: '14',
        name: 'Office Furniture',
        image: ZImages.furnitureIcon,
        isFeatured: false,
        parentId: '3'),
    //electronics
    CategoryModel(
        id: '15',
        name: 'Laptop',
        image: ZImages.electronicsIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '16',
        name: 'Mobile',
        image: ZImages.electronicsIcon,
        isFeatured: false,
        parentId: '5'),
    CategoryModel(
        id: '17',
        name: 'Watches',
        image: ZImages.electronicsIcon,
        isFeatured: false,
        parentId: '5'),
    //Shoes
    CategoryModel(
        id: '18',
        name: 'Nike',
        image: ZImages.shoeIcon,
        isFeatured: false,
        parentId: '8'),
    CategoryModel(
        id: '19',
        name: 'Bata',
        image: ZImages.shoeIcon,
        isFeatured: false,
        parentId: '8'),
    CategoryModel(
        id: '20',
        name: 'Lotto',
        image: ZImages.shoeIcon,
        isFeatured: false,
        parentId: '8'),
    //Cloths
    CategoryModel(
        id: '21',
        name: 'Shirts',
        image: ZImages.clothIcon,
        isFeatured: false,
        parentId: '4'),
    CategoryModel(
        id: '22',
        name: 'Pants',
        image: ZImages.clothIcon,
        isFeatured: false,
        parentId: '4'),
    CategoryModel(
        id: '23',
        name: 'T-Shirts',
        image: ZImages.clothIcon,
        isFeatured: false,
        parentId: '4'),
  ];

  /// Brands
// static final List<BrandModel> brands = [
//   BrandModel(id:'1', image: ZImages.nikeLogo, name: 'Nike', productsCount: 125, isFeatured: true),
//   BrandModel(id:'2', image: ZImages.adidasLogo, name: 'Adidas', productsCount: 15, isFeatured: true),
//   BrandModel(id:'3', image: ZImages.kenwoodLogo, name: 'Kenwood', productsCount: 255, isFeatured: true),
//   BrandModel(id:'4', image: ZImages.ikeaLogo, name: 'IKEA', productsCount:62, isFeatured: true),
//   BrandModel(id:'5', image: ZImages.appleLogo, name: 'Apple', productsCount: 12, isFeatured: false),
//   BrandModel(id:'6', image: ZImages.acerLogo, name: 'Acer', productsCount: 32, isFeatured: true),
//   BrandModel(id:'7', image: ZImages.jordanLogo, name: 'Jordan', productsCount: 23, isFeatured: true),
//   BrandModel(id:'8', image: ZImages.pumaLogo, name: 'Puma', productsCount: 24, isFeatured: false),
//   BrandModel(id:'9', image: ZImages.zaraLogo, name: 'ZARA', productsCount: 241, isFeatured: true)
// ];
  /// Brand Categories
// static final List<BrandCategoryModel> brandCategory = [
//   BrandCategoryModel(brandId: '1', categoryId: '1'),
//   BrandCategoryModel(brandId: '1', categoryId: '8'),
//   BrandCategoryModel(brandId: '1', categoryId: '9'),
//   BrandCategoryModel(brandId: '2', categoryId: '3'),
//   BrandCategoryModel(brandId: '2', categoryId: '5'),
//   BrandCategoryModel(brandId: '2', categoryId: '6'),
//   BrandCategoryModel(brandId: '3', categoryId: '8'),
//   BrandCategoryModel(brandId: '3', categoryId: '6'),
//   BrandCategoryModel(brandId: '4', categoryId: '4'),
//   BrandCategoryModel(brandId: '4', categoryId: '4'),
//   BrandCategoryModel(brandId: '5', categoryId: '6'),
//   BrandCategoryModel(brandId: '6', categoryId: '2'),
//   BrandCategoryModel(brandId: '7', categoryId: '8'),
// ];
  /// Product Categories
// static final List<ProductCategoryModel> productCategory = [
//   ProductCategoryModel(productId: '026', categoryId: '1'),
//   ProductCategoryModel(productId: '024', categoryId: '2'),
//   ProductCategoryModel(productId: '021', categoryId: '2'),
//   ProductCategoryModel(productId: '011', categoryId: '3'),
//   ProductCategoryModel(productId: '091', categoryId: '2'),
//   ProductCategoryModel(productId: '191', categoryId: '2'),
//   ProductCategoryModel(productId: '121', categoryId: '4'),
//   ProductCategoryModel(productId: '131', categoryId: '5'),
//   ProductCategoryModel(productId: '118', categoryId: '6'),
//   ProductCategoryModel(productId: '119', categoryId: '7'),
//   ProductCategoryModel(productId: '199', categoryId: '8'),
//   ProductCategoryModel(productId: '109', categoryId: '9'),
//   ProductCategoryModel(productId: '159', categoryId: '4'),
//   ProductCategoryModel(productId: '059', categoryId: '8'),
//   ProductCategoryModel(productId: '089', categoryId: '2'),
//   ProductCategoryModel(productId: '099', categoryId: '9'),
//   ProductCategoryModel(productId: '079', categoryId: '9'),
//   ProductCategoryModel(productId: '069', categoryId: '9'),
//   ProductCategoryModel(productId: '059', categoryId: '9'),
//   ProductCategoryModel(productId: '039', categoryId: '8'),
//   ProductCategoryModel(productId: '049', categoryId: '8'),
//   ProductCategoryModel(productId: '029', categoryId: '7'),
//   ProductCategoryModel(productId: '019', categoryId: '4'),
//   ProductCategoryModel(productId: '009', categoryId: '10'),
//   ProductCategoryModel(productId: '001', categoryId: '3'),
//   ProductCategoryModel(productId: '002', categoryId: '3'),
//   ProductCategoryModel(productId: '003', categoryId: '4'),
//   ProductCategoryModel(productId: '003', categoryId: '9'),
//   ];

  /// Products List
// final static List<ProductModel> products = [
//   ProductModel(
//       id:,
//   title:,
//   stock:,
//   price:,
//   isFeatured:,
//   thumbnail:,
//   description:,
//   brand:,
//   images:[],
//   salePrice:,
//   sku: ,
//   categoryId:,
//   productAttributes:[],
//   productVariations:[],
//   productType:
//       ),
//   ];
}
