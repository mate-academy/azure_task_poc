$config = (Get-Content 'azure-config.json' | ConvertFrom-Json )

if (-not $config.ClientID) { 
    Write-Error "ClientID is not set in the config file 'azure-config.json'. Please check your azure config and try again."
} else { 
    "ClientID=$($config.ClientID)" | Out-File -FilePath $env:GITHUB_ENV -Append
}

if (-not $config.TenantID) { 
    Write-Error "TenantID is not set in the config file 'azure-config.json'. Please check your azure config and try again."
} else { 
    "TenantID=$($config.TenantID)" | Out-File -FilePath $env:GITHUB_ENV -Append
}

if (-not $config.SubscriptionID) { 
    Write-Error "SubscriptionID is not set in the config file 'azure-config.json'. Please check your azure config and try again."
} else { 
    "SubscriptionID=$($config.SubscriptionID)" | Out-File -FilePath $env:GITHUB_ENV -Append
}
