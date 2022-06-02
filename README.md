# Test

DEMO https://naccs-api.herokuapp.com/api-docs/v1/index.html

This README would normally document whatever steps are necessary to get the
application up and running.

| Languages                                                                          | Version                |
| ---------------------------------------------------------------------------------- | ---------------------- |
| ![image](https://raw.githubusercontent.com/Shahidrox/icone/main/Ruby.svg)          | ruby `'3.0.3'`         |
| ![image](https://raw.githubusercontent.com/Shahidrox/icone/main/Ruby_on_Rails.svg) | rails `'7.0.3'`        |
| ![image](https://raw.githubusercontent.com/Shahidrox/icone/main/PostgreSQL.svg)    | (PostgreSQL) `'13.3'`  |
| ![image](https://raw.githubusercontent.com/Shahidrox/icone/main/Node.svg)          | node (-> `'v17.04.0'`) |

![image](https://raw.githubusercontent.com/Shahidrox/icone/main/Docker.svg)

## Getting Started

```bash
**Run locally**
git clone https://github.com/Shahidrox/naccs.git
cd naccs
rake db:create
rake db:migrate
rake db:seed
rails s
```

```bash
**Run test**
bundle exec rspec
File: naccs/spec/requests/api/v1/vessels_spec.rb
File: naccs/spec/models/vessel_spec.rb
```

## API Document

| **Swagger Doc**                              | -                                                                             |
| -------------------------------------------- | ----------------------------------------------------------------------------- |
| http://localhost:3000/api-docs/v1/index.html | ![image](https://raw.githubusercontent.com/Shahidrox/naccs/main/public/1.png) |

## API

| Type               | method | API                    | Params                                                                            |
| ------------------ | ------ | ---------------------- | --------------------------------------------------------------------------------- |
| Create new vessel  | POST   | `/api/v1/vessels)`     | `{vessel: {"name": "string", "emcompany_id": "string", "naccs_code": "string" }}` |
| Get list of vessel | GET    | `/api/v1/vessels`      | `-`                                                                               |
| Vessel details     | GET    | `/api/v1/vessels/{id}` | `-`                                                                               |
| Update vessel      | PATCH  | `/api/v1/vessels/{id}` | `{vessel: {"name": "string", "emcompany_id": "string", "naccs_code": "string" }}` |
| DELETE vessel      | DELETE | `/api/v1/vessels/{id}` | `-`                                                                               |
