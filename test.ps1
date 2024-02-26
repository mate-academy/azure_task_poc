$repoName="id27182/azure_task_poc"
$commitSHA="4c411abb414e4d433590aecbb0ca4f144f12a44e"
$workflowName="Test"

$response = (Invoke-WebRequest -Uri "https://api.github.com/repos/$repoName/actions/runs" -Headers @{"Accept"="application/vnd.github+json"; "X-GitHub-Api-Version"="2022-11-28"} -UseBasicParsing )
$responseBody = ($response.Content | ConvertFrom-Json -AsHashtable ) 

$workflowRun = ($responseBody.workflow_runs | Where-Object -Property head_sha -EQ -Value $commitSHA)
if (-not $workflowRun -or ($workflowRun.name -ne $workflowName)) { 
    Write-Error "Unable to find a 'Test' workflow run for the last commit in the PR. Please make sure, that you run a workflow on the last commit, pushed to the pull request"
} else {
    if ($workflowRun.status -ne 'completed') { 
        Write-Error "Unable to verify 'Test' workflow: it's status is not 'completed'"
    }
}
