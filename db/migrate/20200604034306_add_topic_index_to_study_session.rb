class AddTopicIndexToStudySession < ActiveRecord::Migration[5.2]
  def change
    add_index :study_sessions, :topic

  end
end
