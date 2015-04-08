class WorkersDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view
  attr_accessor :skill

  def initialize(view)
    @view = view
    @skill = CGI.parse(params["skill_query"])["skill"]
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Worker.count,
      iTotalDisplayRecords: workers.total_entries,
      aaData: data
    }
  end

private

  def data
    workers.map do |worker|
      [
        link_to("#{worker.first_name}", worker),
        link_to("#{worker.last_name}", worker),
        worker.state,
        worker.city,
        worker.age,
        number_to_currency(worker.salary),
      ]
    end
  end

  def workers
    @workers ||= fetch_workers
  end

  # params["skill_query"]
  def fetch_workers
    if @skill.present?
      workers = Worker
        .tagged_with(@skill)
        .order("#{sort_column} #{sort_direction}")
    else
      workers = Worker.order("#{sort_column} #{sort_direction}")
    end
    workers = workers.page(page).per_page(per_page)
    if params[:sSearch].present?
      workers = workers.where("first_name like :search or last_name like :search", search: "%#{params[:sSearch]}%")
    end
    workers
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[first_name last_name state city age salary]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
