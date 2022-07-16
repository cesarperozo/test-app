// To parse this JSON data, do
//
//     final googleResponse = googleResponseFromMap(jsonString);

import 'dart:convert';

class GoogleResponse {
  GoogleResponse({
    required this.htmlAttributions,
    required this.nextPageToken,
    required this.results,
    required this.status,
  });

  List<dynamic> htmlAttributions;
  String? nextPageToken;
  List<Restaurant> results;
  String status;

  factory GoogleResponse.fromJson(String str) =>
      GoogleResponse.fromMap(json.decode(str));

  factory GoogleResponse.fromMap(Map<String, dynamic> json) => GoogleResponse(
        htmlAttributions:
            List<dynamic>.from(json["html_attributions"].map((x) => x)),
        nextPageToken: json["next_page_token"],
        results: List<Restaurant>.from(
            json["results"].map((x) => Restaurant.fromMap(x))),
        status: json["status"],
      );
}

class Restaurant {
  Restaurant({
    required this.businessStatus,
    required this.formattedAddress,
    required this.geometry,
    required this.icon,
    required this.iconMaskBaseUri,
    required this.name,
    required this.openingHours,
    required this.photos,
    required this.placeId,
    required this.priceLevel,
    required this.rating,
    required this.reference,
    required this.userRatingsTotal,
    required this.permanentlyClosed,
  });

  String? businessStatus;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  List<Photo>? photos;
  String? placeId;
  int? priceLevel;
  double? rating;
  String? reference;
  int? userRatingsTotal;
  bool? permanentlyClosed;

  get fullPosterImg {
    if (photos?[0].photoReference != null) {
      return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=${photos?[0].photoReference}&key=AIzaSyCjhGNgCppr02OR5yFOMwFquZRa3n07aL4';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Restaurant.fromJson(String str) =>
      Restaurant.fromMap(json.decode(str));

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        businessStatus: json["business_status"],
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromMap(json["geometry"]),
        icon: json["icon"],
        iconMaskBaseUri: json["icon_mask_base_uri"],
        name: json["name"],
        openingHours: json["opening_hours"] == null
            ? null
            : OpeningHours.fromMap(json["opening_hours"]),
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromMap(x))),
        placeId: json["place_id"],
        priceLevel: json["price_level"] == null ? null : json["price_level"],
        rating: json["rating"].toDouble() ?? null,
        reference: json["reference"],
        userRatingsTotal: json["user_ratings_total"],
        permanentlyClosed: json["permanently_closed"] == null
            ? null
            : json["permanently_closed"],
      );
}

class Geometry {
  Geometry({
    required this.location,
    required this.viewport,
  });

  Location location;
  Viewport viewport;

  factory Geometry.fromJson(String str) => Geometry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
        location: Location.fromMap(json["location"]),
        viewport: Viewport.fromMap(json["viewport"]),
      );

  Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "viewport": viewport.toMap(),
      };
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}

class Viewport {
  Viewport({
    required this.northeast,
    required this.southwest,
  });

  Location northeast;
  Location southwest;

  factory Viewport.fromJson(String str) => Viewport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Viewport.fromMap(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromMap(json["northeast"]),
        southwest: Location.fromMap(json["southwest"]),
      );

  Map<String, dynamic> toMap() => {
        "northeast": northeast.toMap(),
        "southwest": southwest.toMap(),
      };
}

class OpeningHours {
  OpeningHours({
    required this.openNow,
  });

  bool openNow;

  factory OpeningHours.fromJson(String str) =>
      OpeningHours.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OpeningHours.fromMap(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
      );

  Map<String, dynamic> toMap() => {
        "open_now": openNow,
      };
}

class Photo {
  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions:
            List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );

  Map<String, dynamic> toMap() => {
        "height": height,
        "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
      };
}

class PlusCode {
  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  String compoundCode;
  String globalCode;

  factory PlusCode.fromJson(String str) => PlusCode.fromMap(json.decode(str));

  factory PlusCode.fromMap(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );
}

enum Type { BAR, RESTAURANT, FOOD, POINT_OF_INTEREST, ESTABLISHMENT }
