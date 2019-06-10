class VideoTopic < ApplicationRecord
  belongs_to :video
  belongs_to :topic
end
