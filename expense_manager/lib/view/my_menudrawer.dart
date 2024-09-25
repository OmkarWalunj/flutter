
import 'package:expense_manager/view/transaction_screen.dart';
import 'package:expense_manager/view/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'category_screen.dart';
import 'graph_screen.dart';

Widget myDrawer(BuildContext context) {
  return Drawer(
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
          Text(
            "Expense Manager",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            "Saves all your Transactions",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10),
          ),

          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
               Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => 
                      const TransactionScreen()
                  )
                );
            },
            child: Row(
              children: [
                Image.asset("assets/images/10.jpg"),
                Text(
                  "  Transaction",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
             
              Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => 
                      const GraphScreen()
                  )
                );
            },
            child: Row(
              children: [
                Image.asset("assets/images/1.jpg"),
                Text(
                  "  Graphs",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => 
                      const CategoryScreen()
                  )
                );
            },
            child: Row(
              children: [
                Image.asset("assets/images/3.jpg"),
                Text(
                  "  Category",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => 
                      const TrashScreen()
                  )
                );
            },
            child: Row(
              children: [
                Image.asset("assets/images/2.jpg"),
                Text(
                  "  Trash",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Image.asset("assets/images/6.jpg"),
              Text(
                "  About us",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
