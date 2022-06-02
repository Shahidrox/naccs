module Pagination
	extend ActiveSupport::Concern
	def pagination(resources)
		{
			current:      resources.current_page,
			previous:     resources.prev_page,
			next:         resources.next_page,   
			limit:        resources.limit_value,
			total_pages:  resources.total_pages,
			total_count:  resources.total_count
		}
	end
end