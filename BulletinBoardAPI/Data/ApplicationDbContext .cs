using Microsoft.EntityFrameworkCore;
using BulletinBoardAPI.Models;

namespace BulletinBoardAPI.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options) { }

        public DbSet<Announcement> Announcements { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Announcement>().HasNoKey(); 
            base.OnModelCreating(modelBuilder);
        }
    }
}
