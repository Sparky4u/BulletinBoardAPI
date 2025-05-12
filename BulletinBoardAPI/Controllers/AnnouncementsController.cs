using BulletinBoardAPI.Data;
using BulletinBoardAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BulletinBoardAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AnnouncementsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;


        public AnnouncementsController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var result = await _context.Announcements
                .FromSqlRaw("EXEC GetAllAnnouncements")
                .ToListAsync();
            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> Add([FromBody] Announcement model)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC AddAnnouncement @p0, @p1, @p2, @p3, @p4",
                model.Title, model.Description, model.Status, model.Category, model.SubCategory);

            return Ok(new { message = "Announcement added successfully" });
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Announcement model)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC UpdateAnnouncement @p0, @p1, @p2, @p3, @p4, @p5",
                id, model.Title, model.Description, model.Status, model.Category, model.SubCategory);

            return Ok(new { message = "Announcement updated successfully" });
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _context.Database.ExecuteSqlRawAsync("EXEC DeleteAnnouncement @p0", id);
            return Ok(new { message = "Announcement deleted successfully" });
        }
    }
}
