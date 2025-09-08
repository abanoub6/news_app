import 'package:news_application/data/api/source/source_model.dart';

class SourcesResponse {
  final String status;
  final List<SourceModel> sources;

  SourcesResponse({required this.status, required this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'] ?? "",
      sources:
          json['sources'] != null
              ? List<SourceModel>.from(
                json['sources'].map((v) => SourceModel.fromJson(v)),
              )
              : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "sources": sources.map((v) => v.toJson()).toList(),
    };
  }
}
