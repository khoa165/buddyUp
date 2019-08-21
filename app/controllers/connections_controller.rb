class ConnectionsController < ApplicationController
  def index
    users = User.geocoded
    users = users.where.not(user: current_user)

    query = params[:location]
    if query.present?
      # users = users.where("species ILIKE ?", "%#{query}%")
      users = users.near(query, 20)
    else
      users = users.near([current_user.latitude, current_user.longitude], 20)
    end

    @matches = retrieve_buddies(users)
  end

  private

  def retrieve_buddies(users)
    options = []
    users.each do |user|
      options << [user, compute_score(user)]
    end
    options.sort_by { |option| -option[1] }
  end

  def compute_score(target_user)
    UserResponse.joins(:responses).joins(:questions).group(:description).where(user: User.first)

    arr = UserResponse.joins("INNER JOIN responses ON user_responses.response_id = responses.id").joins("INNER JOIN questions ON responses.question_id = questions.id").where(user: User.first).group('question.description')

    arr = UserResponse.joins("INNER JOIN responses ON user_responses.response_id = responses.id").joins("INNER JOIN questions ON responses.question_id = questions.id").where(user: User.first).group('question.description = "Personality"')

    Artist.select('artists.*, COUNT(tracks.name) AS track_count')
        .joins(albums: { tracks: :genre })
        .where(genres: { name: genre_name })
        .group('artists.name')
        .order('track_count DESC')
        .limit(5)

    Question.joins(:responses).group(:description).where(user: User.first)

    target_user.user_responses.joins(:response).group(:question_id)
  end
end
