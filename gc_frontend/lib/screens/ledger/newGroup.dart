import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1.0,
        minChildSize: 1.0,
        maxChildSize: 1.0,
        builder: (context, controller) {
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.highlight_remove,
                          color: Color.fromRGBO(54, 54, 54, 1),
                          size: 22.0,
                        )),
                    const SizedBox(width: 10),
                    Text("Create New Group",
                        style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(54, 54, 54, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                Form(
                    child: Column(
                  children: [
                    TextField(),
                    Text("ADD A PROFILE PICTURE"),
                    TextField(),
                    TextField(),
                    Row(
                      children: [
                        Text("Add Bank Account"),
                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Add Transcation Categories"),
                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Modify Settings",
                          style: GoogleFonts.montserrat(),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    )
                  ],
                ))
              ],
            ),
          );
        });
  }
}
