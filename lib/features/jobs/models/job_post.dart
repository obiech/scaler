// Package imports:
import 'package:equatable/equatable.dart';

/// Represents a job post with various details such as company name, job title, etc.
/// Implements [Equatable] to allow easy comparison between instances.
class JobPost extends Equatable {
  const JobPost({
    required this.logo,
    required this.jobTitle,
    required this.location,
    required this.createdAt,
    required this.companyName,
    required this.id,
    required this.workplacePreference,
    required this.type,
  });

  /// Factory constructor to create a [JobPost] instance from a JSON map.
  /// This maps fields from the nested structure of the JSON to the respective class fields.
  factory JobPost.fromJson(Map<String, dynamic> map) {
    final job = map['job'];
    return JobPost(
      id: job['uuid'] ?? '',
      logo: job['company']?['logo'] ?? '',
      location: job['location']?['name_en'] ?? '',
      createdAt: job['created_date'] ?? '',
      companyName: job['company']?['name'] ?? '',
      type: job['type']?['name_en'],
      workplacePreference: job['workplace_preference']?['name_en'],
      jobTitle: job['title'] ?? '',
    );
  }

  /// Converts the [JobPost] instance back to a JSON map.
  /// This is useful for serializing the object to be sent to an API or for local storage.
  Map<String, dynamic> toJson() {
    return {
      'job': {
        'uuid': id,
        'company': {
          'logo': logo,
          'name': companyName,
        },
        'location': {
          'name_en': location,
        },
        'created_date': createdAt,
        'type': {
          'name_en': type,
        },
        'workplace_preference': {
          'name_en': workplacePreference,
        },
        'title': jobTitle,
      },
    };
  }

  /// Fields representing various details of the job post.
  final String logo, // URL or path of the company logo
      jobTitle, // Title of the job position
      location, // Location where the job is based
      createdAt, // Date when the job was posted
      companyName, // Name of the company offering the job
      id, // Unique identifier for the job post
      type, // Type of employment (e.g., Full-Time, Part-Time)
      workplacePreference; // Whether the job is remote, in-office, or hybrid

  /// List of properties used by [Equatable] to compare [JobPost] objects.
  /// This allows for equality checks based on the field values.
  @override
  List<Object?> get props => [
        logo,
        jobTitle,
        location,
        createdAt,
        companyName,
        type,
        workplacePreference,
      ];
}
