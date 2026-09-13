# InfraQ scheduled drift and policy auto-fix demo

- Scan ID: `demo-scheduled-3e374e6d-dcb7-41e6-8dba-84cd9073c789`
- Schedule: daily Drift Guard scan
- Detection: unmanaged public SSH ingress
- Drift resource: `aws_security_group.web_admin`
- Policy: `CKV_AWS_25`
- Multi-agent remediation: orchestrator -> architect -> engineer -> reviewer -> security_prover -> devops

## Fix intent

Remove or reconcile the unauthorized `tcp/22` ingress rule from `0.0.0.0/0`.
This demo PR records the exact finding context that the auto-fix workflow would apply to Terraform.

## Validation plan

- Run `terraform fmt`.
- Run `terraform validate`.
- Run policy scan and confirm `CKV_AWS_25` is no longer present.
- Re-run Drift Guard and confirm zero drift and zero policy findings.
