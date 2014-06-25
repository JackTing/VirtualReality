module ApplicationHelper
  def menus_sort (a)
    len=a.length  
    for i in 0..len-1  
        t=a[i]  
        for j in 0..i  
            if a[j].custom_sort>t.custom_sort
                a[j],t=t,a[j]  
            end   
        end  
        a[i]=t  
    end  
    return a  
  end
  def project_sitemenus
    Project.find_by_number(current_user.project.number).sitemenus 
  end
end
