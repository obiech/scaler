import 'package:scaler/features/jobs/models/job_details.dart';
import 'package:scaler/features/jobs/models/job_post.dart';

const jobId = '1';
const mockJobDetailsJson = {
  'data': {
    'id': '311',
    'created_date': '2024 - 07 - 03',
    'salary_range': [0, 1500],
    'benefits': [],
    'location': {
      'name_ar': 'جدة',
      'name_en': 'Jeddah',
    },
    'open_for_discussion': false,
    'commission_based': true,
    'type': {
      'id': 'w',
      'name_ar': ' دوام كامل',
      'name_en': 'Full-time',
      'order': '',
    },
    'status': {'id': 1, 'name_ar': 'متاح', 'name_en': 'Opened'},
    'workplace_preference': {
      'id': '2',
      'name_ar': 'حضوري',
      'name_en': 'On-Site',
    },
    'workplace_type': {'id': 1, 'name_ar': 'حضوري', 'name_en': 'On-Site'},
    'vertical': {'id': 1, 'name_ar': 'المبيعات', 'name_en': 'Sales'},
    'is_predefined_list_set': true,
    'uuid': '1',
    'title': 'Software Engineer',
    'company': {
      'name': 'منجز',
      'logo': 'https://i.ibb.co/Y2v3VDP/images.png',
      'industry': 'Transportation and Logistics',
      'description': 'adsfaasdf asfdafadsfaasdf asfdaf',
      'website': 'https://www.linkedin.com/company/slingbiz',
      'linkedin': 'https://www.linkedin.com/company/slingbiz',
      'twitter': 'https://meow.com/sa',
    },
    'icp_answers': {
      'job-role': [
        {
          'id': '2',
          'title_ar': 'Presales - قبل المبيعات',
          'title_en': 'Presales',
          'next_question': ['nature-of-work'],
          'description_ar': 'استقطاب',
          'description_en': 'nication skills with clients and breaking the ice',
        }
      ],
      'type-of-sales': [
        {
          'id': '2',
          'title_ar': 'Business to Business',
          'title_en': 'Business to Business',
          'next_question': ['client'],
          'description_ar': 'تتركز',
          'description_en': 'The candidate',
        }
      ],
    },
  },
};

final jobs = [
  const JobPost(
    id: '1',
    jobTitle: 'Software Engineer',
    companyName: 'Company A',
    location: 'Riyah',
    workplacePreference: 'Remote',
    type: 'Full-time',
    logo: 'logo_url',
    createdAt: '2024-10-01',
  ),
  const JobPost(
    id: '2',
    jobTitle: 'Product Manager',
    companyName: 'Company B',
    location: 'Riyah',
    workplacePreference: 'On-site',
    type: 'Part-time',
    logo: 'logo_url',
    createdAt: '2024-10-01',
  ),
];

const job = JobPost(
  id: '1',
  jobTitle: 'Software Engineer',
  companyName: 'Company A',
  location: 'Riyah',
  workplacePreference: 'Remote',
  type: 'Full-time',
  logo: 'logo_url',
  createdAt: '2024-10-01',
);

const jobdetails = JobDetails(
  id: '1',
  category: 'fin tech',
  companyName: 'Test Company',
  location: 'Test Location',
  logo: '',
  type: 'Full-Time',
  workPreference: 'Onsite',
  jobDescription: 'Test description',
  requirements: [],
  tags: [],
  title: 'Senior Test application',
);

const mockJobPostJson = {
  'data': [
    {
      'job': {
        'id': '311',
        'uuid': '1',
        'created_date': '2024-07-03',
        'salary_range': [0, 1500],
        'benefits': [],
        'location': {
          'id': 19,
          'name_ar': 'جدة',
          'name_en': 'Jeddah',
          'list_order': 3,
        },
        'open_for_discussion': false,
        'commission_based': true,
        'type': {
          'id': 2,
          'name_ar': 'دوام كامل',
          'name_en': 'Full-time',
          'order': 1,
        },
        'status': {'id': 1, 'name_ar': 'متاح', 'name_en': 'Opened'},
        'workplace_preference': {
          'id': 1,
          'name_ar': 'حضوري',
          'name_en': 'On-Site',
        },
        'workplace_type': {'id': 1, 'name_ar': 'حضوري', 'name_en': 'On-Site'},
        'vertical': {'id': 1, 'name_ar': 'المبيعات', 'name_en': 'Sales'},
        'is_predefined_list_set': true,
        'company': {
          'name': 'Tamara',
          'logo': 'https://i.ibb.co/VjQhBH5/683ec87cd067544e.jpg',
        },
        'icp_answers': {
          'job-role': [
            {
              'id': 2,
              'title_ar': 'Sales - المبيعات',
              'title_en': 'Sales',
              'next_question': ['type-of-sales'],
              'description_ar':
                  'عرض الخدمات للعملاء المؤهلين و إغلاق الصفقات ويتميز المرشح هنا بمهاراته في عرض الحل والتفاوض لإغلاق الصفقة',
              'description_en':
                  'Offering services to qualified clients and closing deals, the candidate here excels with their skills in presenting solutions and negotiating to seal the deal',
            }
          ],
        },
      },
    }
  ],
};
