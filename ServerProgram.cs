using moovpad.Server;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.EntityFrameworkCore;
using System;
 
var builder = WebApplication.CreateBuilder(args);
 
//added
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(
        policy =>
        {
            policy.AllowAnyOrigin();
            policy.AllowAnyMethod();
            policy.AllowAnyHeader();
        });
});
 
// Add services to the container.
 
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();
 
//added
builder.Services.AddDbContext<us001DbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("User"));
});
builder.Services.AddDbContext<moov001DbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("Moov"));
});
builder.Services.AddDbContext<pape001DbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("Pape"));
});
 
var app = builder.Build();
 
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error");
}
 
app.UseBlazorFrameworkFiles();
app.UseStaticFiles();
 
app.UseRouting();
 
//added
app.UseCors();
//app.UseAuthentication();
//app.UseAuthorization();
 
 
app.MapRazorPages();
app.MapControllers();
app.MapFallbackToFile("index.html");
 
app.Run();
