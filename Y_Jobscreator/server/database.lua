-- Job in Datenbank speichern
function saveJobToDB(job)
    MySQL.Async.execute('INSERT INTO jobs (name, label) VALUES (@name, @label)', {
        ['@name'] = job.name,
        ['@label'] = job.label
    }, function(rowsChanged)
        for _, rank in pairs(job.ranks) do
            MySQL.Async.execute('INSERT INTO job_grades (job_name, grade, name, salary) VALUES (@job_name, @grade, @name, @salary)', {
                ['@job_name'] = job.name,
                ['@grade'] = rank.grade,
                ['@name'] = rank.name,
                ['@salary'] = rank.salary
            })
        end
    end)
end

-- Alle Jobs aus Datenbank laden
function loadAllJobs()
    MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(results)
        for _, job in pairs(results) do
            MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @job_name', {
                ['@job_name'] = job.name
            }, function(grades)
                job.grades = grades
                TriggerClientEvent('jobCreator:loadJob', -1, job)
            end)
        end
    end)
end
