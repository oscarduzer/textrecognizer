import 'package:flutter/material.dart';

class Document{
    String path;
    Document({required this.path}){

    }


    DocumentType getDocumentType(){
        String path=this.path;
        if(path.endsWith('.pdf')){
            return DocumentType.pdf;
        }
        else if(path.endsWith('.txt')){
            return DocumentType.txt;
        }
        else if(path.endsWith('.docx')){
            return DocumentType.word;
        }
        else {
          return DocumentType.folder;
        }
    }

    Color getDocumentColor(){
      switch(this.getDocumentType()){
        case DocumentType.pdf:
          return Colors.red;
        case DocumentType.txt:
          return Colors.blue;
        case DocumentType.word:
          return Colors.green;
          default:
            return Colors.grey;
      }
    }

    Icon getDocumentIcon(Color color){
      switch(this.getDocumentType()){
        case DocumentType.pdf:
          return Icon(Icons.picture_as_pdf,color: color,size: 30,);
          case DocumentType.txt:
          return Icon(Icons.text_snippet,color: color,size: 30,);
        case DocumentType.word:
          return Icon(Icons.edit_document,color: color,size: 30,);
          default:
            return Icon(Icons.folder,color: color,size: 30,);
      }
    }
}


enum DocumentType{
  pdf,
  folder,
  txt,
  word,
}