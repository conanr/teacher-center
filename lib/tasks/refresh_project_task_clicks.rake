desc "Refreshes click statistics on a project task"

task :refresh_project_task_clicks => :environment do
  ProjectTask.all.each do |project_task|
    project_task.update_clicks
  end
  Project.all.each do |project|
    project.log_project_clicks
  end

end
