import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'api/job_api_client.dart';
import 'bloc/jobs_bloc.dart';

//void main() => runApp(GraphQL_Page(jobsApiClient: JobsApiClient.create()));

class GraphQL_Page extends StatelessWidget {
  const GraphQL_Page({Key? key, required this.jobsApiClient}) : super(key: key);

  final JobsApiClient jobsApiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => JobsBloc(
          jobsApiClient: jobsApiClient,
        )..add(JobsFetchStarted()),
        child: JobsPage(),
      ),
    );
  }
}

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetching data from https://api.graphql.jobs')),
      body: Center(
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsLoadInProgress) {
              return CircularProgressIndicator();
            }
            if (state is JobsLoadSuccess) {
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (context, index) {
                  final job = state.jobs[index];
                  return ListTile(
                    key: Key(job.id),
                    leading: Icon(Icons.location_city),
                    title: Text(job.title),
                    trailing: Icon(
                      job.isFeatured == true ? Icons.star : Icons.star_border,
                      color: Colors.orangeAccent,
                    ),
                    subtitle: job.locationNames != null
                        ? Text(job.locationNames!)
                        : null,
                  );
                },
              );
            }
            return Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
