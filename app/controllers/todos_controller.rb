class TodosController < ApplicationController
  def index
    render "todos/index"
  end

  def show
    id = params[:id]
    if(!id)
      render plain: Todo.order(:date&&:id).map {|todo| todo.to_pleasant_string}.join("\n")
    else
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
    end
  end

  def delete
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to '/'
  end

  def update
    id= params[:id]
    todo = Todo.find(id)
    todo[:completed]=true
    if todo.save
    redirect_to "/"
    end
    #render plain: Todo.order(:date&&:id).map {|todo| todo.to_pleasant_string}.join("\n")

  end

  def home
    render "home"
  end

  def list
    render plain: Todo.order(:date&&:id).map {|todo| todo.to_pleasant_string}.join("\n")
  end

  def insert
   task = params[:task]
   date = DateTime.parse(params[:date])
   completed = params[:completed]
   todo=Todo.create!(task: task,date: date,completed:false)
    response = "New todo is created with this id #{todo.id}"
    render plain: response
  end

  def create
    task = params[:task]
    date = params[:date]
    todo = Todo.create!(
      task: task,
      date: date,
      completed: false,
    )
    if todo
      #render plain: Todo.order(:date).map {|todo| todo.to_pleasant_string}.join("\n")
      redirect_to "/"
    else
      render plain: "Fail"
    end
  end

end
