class User < ActiveRecord::Base
	has_secure_password


	has_many :todo_lists

	validates :email, presence: true,
					uniqueness: true,
					format: {
						with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
					}

	before_save :downcase_email


	def downcase_email
		self.email = email.downcase 
	end

	def generate_password_reset_token!
		update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
	end

	def create_default_lists
		tutorial todo_lists.find_or_create_by(title: "Manus Tutorial")
		tutorial.todo_items.find_or_create_by(content: "Add a list or task by clicking on the \"+\" button at the top." )
		tutorial.todo_items.find_or_create_by(content: "The numbers next to the lists indicate how many tasks they have.")
		tutorial.todo_items.find_or_create_by(content: "Clicking or tapping on the list takes you to its' tasks. ")
		tutorial.todo_items.find_or_create_by(content: "Clicking or tapping the list title again gives you more options")
		tutorial.todo_items.find_or_create_by(content: "Clicking or tapping the circle next to a task will complete the item.")
		tutorial.todo_items.find_or_create_by(content: "Clicking or tapping on the circle again will make it incomplete")
		tutorial.todo_items.find_or_create_by(content: "Clicking or tapping into the task lets you edit or delete its contents")
	end

end
