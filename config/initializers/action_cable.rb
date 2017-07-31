if Rails.env.development?
  Rails.application.config.action_cable.allowed_request_origins =  ['http://side-project-faisal-hassan.c9users.io:8080']
end