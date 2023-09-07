import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
User? currentUser=auth.currentUser;


const usersCollection="Users";
const cartCollection="Carts";
const shippingCollection="Shippings";
const orderCollections="Orders";
const sellerCollection="Sellers";
const productCollection="Products";
const messageCollection="Messages";
const chatCollection="Chats";
const userroleCollection="Roles";