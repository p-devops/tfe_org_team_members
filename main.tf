provider "tfe" {
   hostname = var.hostname
   token    = var.token
}

resource "tfe_organization" "test" {
    name  = "tfe-created-org"
    email = var.user_email
  }

resource "tfe_team" "test" {
    name         = "tfe-created-team"
    organization = tfe_organization.test.id
}

resource "tfe_organization_membership" "test" {
    organization = tfe_organization.test.id
    email        = var.user_email2
}

resource "tfe_team_organization_member" "test" {
    team_id                    = tfe_team.test.id
    organization_membership_id = tfe_organization_membership.test.id
}