# Senpai repair back office

## Description

Senpai repair shop back office software.

## Setup

Install Ruby gems dependencies at local install path as vendor/bundle

```
bundle install --path vendor/bundle
```

Setup migrations and seed data

```
bundle exec rake db:migrate db:seed
```

If testing this with the frontend HTTP server on the same machine, Start the backend development server in the background

```
nohup bundle exec rake server QUEUE="*" --trace > rake.out 2>&1 &
```

This server should now be accessible at [http://localhost:9292](http://localhost:9292).
## API endpoints supported

### Service people
- POST /service_people
- GET /service_people
- GET /service_people/:id
- DELETE /service_people/:id

### Jobs
- POST /jobs
- GET /jobs
- GET /jobs/:id

### Job categories
- POST /job_categories
- GET /job_categories/:id
- DELETE /job_categories/:id

## Associated frontend code

https://github.com/mbutura/senpai-repair-frontend
