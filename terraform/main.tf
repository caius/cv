resource "vercel_project" "this" {
  name      = "cv"
  framework = "hugo"

  # baseURL magic builds with SITE_URL if set, if not then VERCEL_URL
  build_command = "hugo --gc --minify --baseURL https://$${SITE_URL:-$VERCEL_URL}/ $${BUILD_ENV_ARGS}"

  environment = [
    # Preview builds drafts/expired/future posts
    {
      key   = "BUILD_ENV_ARGS"
      value = "--buildDrafts --buildExpired --buildFuture"
      target = [
        "development",
        "preview"
      ]
    },
    # Preview builds are in development env
    {
      key   = "HUGO_ENV"
      value = "development"
      target = [
        "development",
        "preview"
      ]
    },
    # Production builds are in production env
    {
      key   = "HUGO_ENV"
      value = "production"
      target = [
        "production"
      ]
    },
    # Production builds point at main domain name
    {
      key   = "SITE_URL"
      value = "cv.caius.name"
      target = [
        "production"
      ]
    },
    # Pin hugo version used for deployments
    {
      key   = "HUGO_VERSION"
      value = "0.85.0"
      target = [
        "development",
        "preview",
        "production"
      ]
    }
  ]

  git_repository = {
    type = "github"
    repo = "caius/cv"
  }
}

resource "vercel_project_domain" "this" {
  project_id = vercel_project.this.id
  domain     = "cv.caius.name"
}
