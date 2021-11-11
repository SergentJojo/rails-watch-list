class AddReferenceToMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :list, foreign_key: true
  end
end
