import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Fieldmanager/brand_details.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Fieldmanager/Category_details.dart';
import 'package:merchandising/Fieldmanager/editbrands_to_outlets.dart';
import 'package:merchandising/Fieldmanager/product_details.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'outletbrandmapping.dart';
import 'package:merchandising/api/FMapi/outlet brand mappingapi.dart';


List<String> InputListoutletname=[];
List<String> distantlistaddress=[] ;
List<String> distantlistcontact=[];


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Text(
            'Products',
            style: TextStyle(color: orange),
          ),
        ),
        drawer: Drawer(
          child: Menu(),
        ),
        body: Stack(
          children: [
            BackGround(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductContainer(
                  text: "Brand",
                  onpress: (){
                  Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (BuildContext context) =>
                               BrandDetails()));
               },
                ),
                ProductContainer(text: "Category",
               onpress:(){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (BuildContext context) =>
                             CategoryDetails()));
               } ,
               ),
                ProductContainer(text: "Product Details",
                  onpress:(){

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ProductDetails()));
                  } ,
                ),

                ProductContainer(text: "Add Brands to Outlets",
                  onpress:()async{
                    setState(() {
                      isApiCallProcess = true;
                    });
                    await getmappedoutlets();
                     InputListoutletname = mapping.outletname.toSet().toList();
                     distantlistcontact=[];
                     distantlistaddress=[];
                     for(int i=0;i<InputListoutletname.length;i++){
                       distantlistaddress.add(mapping.outletaddress[mapping.outletname.indexOf(InputListoutletname[i])]);
                       distantlistcontact.add(mapping.outletnumber[mapping.outletname.indexOf(InputListoutletname[i])]);
                     }
                     print(InputListoutletname);
                     print(distantlistaddress);

                    print('length: ${distantlistaddress.length}');
                     print(distantlistcontact);
                    setState(() {
                      isApiCallProcess = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                OutletsmapedtoBrands()));
                  } ,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  ProductContainer({this.text,this.onpress});
  final text;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: pink,borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: TextStyle(fontSize: 16.0),),
            Icon(Icons.keyboard_arrow_right,size: 30.0,color: orange,)
          ],
        ),

      ),
    );
  }
}










