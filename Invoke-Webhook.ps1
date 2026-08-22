$webhookUrl = "http://localhost:5678/webhook-test/customer-onboarding-event"

$payload = @{
	event_type = "employee_onboarding"
	employee_id = "EMP-94827"
    department = "Engineering"
    name = "Jane Doe"
    message = "Triggering IT Provisioning Workflow"
} | ConvertTo-Json

try {
	$response = Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $payload -ContentType "application/json"
	Write-Output "Success: Event dispatched."
	$response
} catch {
	Write-Error "Failed to dispatch event. Check URL and network connectivity."
}