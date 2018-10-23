OSS Tracker
==========

[![Build Status](https://travis-ci.org/Netflix/osstracker.svg?branch=master)](https://travis-ci.org/Netflix/osstracker)
[![NetflixOSS Lifecycle](https://img.shields.io/osslifecycle/Netflix/osstracker.svg)]()

OSS Tracker is an application that collects information about a Github organization and aggregates the data across
all projects within that organization into a single user interface to be used by various roles within the owning
organization.

For the community manager, all repositories are listed and metrics are combined for the organization as a whole.  A
community manager can also organize projects into functional areas and appoint shepherds of these areas to assign
management and engineering leads.

The shepherds of each functional area can not only assign and maintain leads for each project, but also view
aggregated metrics for their area.

For individual owners, the OSS tracker gives a daily summary as well as historical information on key repository
metrics such as open issues and pull requests, days since last commit, and average time to resolve issues and pull
requests.

OSS Tracker works by running multiple analysis jobs as part of osstracer-scraper periodically.  These jobs populate
a project ownership database as well as a time series project statistics database.  OSS Tracker then exposes a web
application (osstracker-console) that gives visibility into these databases as well as access to control ownership
and categorization of each project.  In order to decrease the need for advanced visualization, much of the time series
data graphing leverages kibana on top of elasticsearch.

More Info
=========
You can see more about OSS Tracker from our meetup [video](https://www.youtube.com/watch?v=5s-SS_aXoi0) and [slides](http://www.slideshare.net/aspyker/netflix-open-source-meetup-season-4-episode-1).

Deployment
==========
To deploy the project locally with Docker:

1. Starting from the root of the project, Run the build: `./gradlew shadowJar`
2. Set the environment variables 'github_org' and 'github_oauth'
    * You can generate the oauth token by [following these GitHub instructions](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
3. Run 'docker-compose up --build -d'

The project should now be running and reachable at [http://localhost:3000](http://localhost:3000) but it may take some time to show anything useful.

LICENSE
=======

Copyright 2016 Netflix, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
