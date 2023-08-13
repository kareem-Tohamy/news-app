import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../modules/web_view/web_view_screen.dart';

Widget buildArticleItem(article,context)=>InkWell(
  onTap: ()
  {
    navigateTo(context, WebView_screen(article['url']));
  },
  child:   Padding(
  padding: const EdgeInsets.all(20),
  child: Row(
  children: [
  Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  image: DecorationImage(
  image: NetworkImage(
  article['urlToImage']==null?
  'https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg'
      :article['urlToImage'],
  ),
  fit: BoxFit.cover,

  )
  ),
  ),
  SizedBox(width: 20,),
  Expanded(
  child: Container(
  height: 120,
  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Expanded(
    child:   Text(
      '${article['title']}',
    style: Theme.of(context).textTheme.bodyText1,
    maxLines: 4,
    overflow: TextOverflow.ellipsis,
    ),
  ),
   Expanded(
     child: Text(
  '${article['publishedAt']}',
  style: TextStyle(
  color: Colors.grey,
  fontSize: 20,
  fontWeight: FontWeight.w600,
  ),
  ),
   ),
  ],
  ),
  ),
  ),
  ],
  ),
  ),
);

Widget MyDivider()=>Container(
  height: 2,
  width: double.infinity,
  color: Colors.grey,
);

Widget ArticleBuild(list,context)=>
    ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>buildArticleItem(list[index],context),
    separatorBuilder:(context,index)=>MyDivider(),
    itemCount:list.length ,
  ),
  fallback: (context)=>const Center(child: CircularProgressIndicator()),
);
void navigateTo(context,Widget)=> Navigator.push(
    context,
    MaterialPageRoute(
        builder:(context)=>Widget,
    ),
);