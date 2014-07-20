module StatsHelper

	def sortable(column, title = nil)
		title ||= column.titleize
		direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
		link_to title, sort: column, direction: direction
	end

	def filterable(anchor, column = nil)
		if anchor != 'Clear Filter'
			link_to anchor, where_key: column, where_value: anchor
		else
			link_to 'Clear Filter', stats_show_path
		end		
	end
end
