// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'package:scaler/core/helpers/extract_values.dart';

/// Represents the details of a job posting.
class JobDetails extends Equatable {
  const JobDetails({
    required this.id,
    required this.category,
    required this.companyName,
    required this.location,
    required this.logo,
    required this.type,
    required this.workPreference,
    required this.jobDescription,
    required this.requirements,
    required this.tags,
    required this.title,
  });

  /// Creates a [JobDetails] instance from JSON data.
  factory JobDetails.fromJson(Map<String, dynamic> json) {
    return JobDetails(
      id: json['uuid'] ?? '',
      companyName: json['company']?['name'] ?? '',
      category: json['company']?['industry'] ?? '',
      logo: json['company']?['logo'] ?? '',
      tags: extractTitles(json, 'title_en'),
      title: json['title'] ?? '',
      location: json['location']?['name_en'] ?? '',
      type: json['type']?['name_en'] ?? '',
      workPreference: json['workplace_preference']?['name_en'] ?? '',
      jobDescription: json['company']['description'] ?? '',
      requirements: extractTitles(json, 'description_en'),
    );
  }

  // Define the properties of the JobDetails class.
  final String id, // Unique identifier for the job.
      companyName, // Name of the company.
      category, // Category of the job.
      logo, // Company logo URL.
      location, // Job location.
      type, // Type of the job.
      workPreference, // Workplace preference.
      title, // Job title.
      jobDescription; // Description of the job.

  // Lists for requirements and tags associated with the job.
  final List<String> requirements, tags;

  @override
  List<Object?> get props => [
        id,
        title,
        companyName,
        category,
        logo,
        tags,
        location,
        type,
        workPreference,
        jobDescription,
        requirements,
      ];
}
