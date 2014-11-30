namespace :invalid do

  desc "find bad data"
  task find: :enviroment do
    missing_a_membership_user = Membership.where.not(user_id: User.all).count
    missing_a_membership_project = Membership.where.not(project_id: Project.all).count
    missing_a_comment_task = Comment.where.not(task_id: Task.all).count
    missing_a_comment_user = Comment.where.not(user_id: User.all).count
    p "There are #{missing_a_membership_user + missing_a_membership_project}
    records for memberships with missing data"
    p "There are #{missing_a_comment_task + missing_a_comment_user}
    records for comments with missing data"
  end

  desc "delete invalid memberships"
  task memberships: :enviroment do
    Membership.where.not(user_id: User.pluck(:id)).delete_all
    Membership.where.not(project_id: Project.pluck(:id)).delete_all
  end

  desc "delete invalid comments"
  task comments: :enviorment do
    Comment.where.not(task_id: Task.pluck(:id)).delete_all
    Comment.where.not(user_id: User.pluck(:id)).delete_all
  end
end
