$githubToken = $args[0]
$githubUser = $args[1]
$githubRepo = $args[2]
$message = "chore: Bump toc for latest patch"

$headers = @{
    "Accept" = "application/vnd.github+json"
    "Authorization" = "Bearer $githubToken"
    "X-GitHub-Api-Version" = "2022-11-28"
}

$body = @{
    "ref" = "master"
    "inputs" = @{"message" = "$message"}
} | ConvertTo-Json -Compress

$confirmation = Read-Host "Confirm bumping version [y/n]"
if ($confirmation -eq 'y') {
    Invoke-RestMethod -Uri "https://api.github.com/repos/$githubUser/$githubRepo/actions/workflows/tocBump.yml/dispatches" `
                      -Method Post `
                      -Headers $headers `
                      -Body $body
}
