import 'dart:html';

class DomainLayerException implements Exception{

  String cause;

  DomainLayerException(this.cause);

  String toString(){

    return cause;
  }


}