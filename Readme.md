Create new project:

  - In package.json, add under dependencies:
  	**"Microsoft.AspNetCore.Mvc": "1.0.0"**

  - Under startup.cs, add under " public void ConfigureServices(IServiceCollection services)"
  	**{
              services.AddMvc();
          }**
  - Then add under " public void Configure(IApplicationBuilder app)"
  	**app.UseMvc(routes =>
          {
              routes.MapRoute(
                  name: "default",
                  template: "{controller=Home}/{action=Index}/{id?}");
          });**
  - Create a new folder called **Controllers**
  - Inside Controllers folder, create a file called **HomeControllers**

  - Add new folder called **View**
  - Inside Views folder, add another folder called **Home**
  - Inside Views/Home, create a file named **Index.cshtml** and enter in the following content:
      **@
          {
            PlaceHolder for View
          }
        <h2> Page title</h2>**
        
__________________________________

Create database:

  - Open SQL Server Management Studio (SSMS)
  - Enter the following in the Connect to Server window and hit Connect:
  **Server type: Database Engine
  Server name: (localdb)\MSSQLLocalDB
  Authentication: Windows Authentication**

  - Right click Databases under (localdb)\MSSQLLocalDB and select *New Database* then type *"Your Project Name"* then click OK.
  - Expand Database to right-click *Tables>Table...*. A file will show up in the main window with grid asking for column name.
  - Mark first column to be the primary key - right-click arrow next to the first column name to set it as primary key
  - Add and name additional columns as needed, with associated value and Allow nulls value
  - Expand the Tables folder in the ToDoList database and you should see dbo.Items. If not, refresh the Object Explorer by pressing F5. Right-click dbo.Items and select Edit Top 200 Rows to see the table with existing components
_________________________________

Continue with project creation:

  Now that we have some data in our database, we can continue:
  - Right-click project in the Solution explorer to add new item named **appsettings.json**; by also selecting the *ASP.NET Configuration File*.
  - New appsettings file should content:
    **{
      "ConnectionStrings": {
        "DefaultConnection": "Server=(localdb)\\MSSQLLocalDB;Database=_CHANGE_ME;Trusted_Connection=True;MultipleActiveResultSets=true"
      }
    }**
  - Replacing "CHANGE-ME" above by the name of your project.
  - Add the following in the *project.json dependencies* file:
    **...
      "Microsoft.EntityFrameworkCore": "1.0.0",
      "Microsoft.EntityFrameworkCore.SqlServer": "1.0.0",
      ...**
