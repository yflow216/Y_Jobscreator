function createJob() {
    let jobName = document.getElementById('jobName').value;
    let jobLabel = document.getElementById('jobLabel').value;
    fetch(`https://${GetParentResourceName()}/createJob`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            name: jobName,
            label: jobLabel
        })
    });
}

function closeUI() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST'
    });
}
