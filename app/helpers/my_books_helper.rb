module MyBooksHelper
  def sort_by_distance(user, users)
		users.sort_by { |a| user.distance_to(a) }
	end
end
