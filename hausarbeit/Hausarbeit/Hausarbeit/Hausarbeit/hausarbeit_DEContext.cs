using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Hausarbeit
{
    public partial class hausarbeit_DEContext : DbContext
    {
        public hausarbeit_DEContext()
        {
        }

        public hausarbeit_DEContext(DbContextOptions<hausarbeit_DEContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Aufgabenstellung> Aufgabenstellungs { get; set; } = null!;
        public virtual DbSet<Inhalt> Inhalts { get; set; } = null!;
        public virtual DbSet<Kapitel> Kapitels { get; set; } = null!;
        public virtual DbSet<Rueckmeldung> Rueckmeldungs { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.\\;Initial Catalog=hausarbeit_DE;Integrated Security=SSPI");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Aufgabenstellung>(entity =>
            {
                entity.HasKey(e => e.AgsId)
                    .HasName("PK__Aufgaben__F62DFC497F0E9EF4");

                entity.ToTable("Aufgabenstellung");

                entity.Property(e => e.AgsId).HasColumnName("AGS_id");

                entity.Property(e => e.AgsText)
                    .HasColumnType("ntext")
                    .HasColumnName("AGS_Text");

                entity.Property(e => e.InhaltId).HasColumnName("Inhalt_id");

                entity.HasOne(d => d.Inhalt)
                    .WithMany(p => p.Aufgabenstellungs)
                    .HasForeignKey(d => d.InhaltId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_InhaltAufgabenstellung");
            });

            modelBuilder.Entity<Inhalt>(entity =>
            {
                entity.ToTable("Inhalt");

                entity.Property(e => e.InhaltId).HasColumnName("Inhalt_id");

                entity.Property(e => e.InhaltText)
                    .HasColumnType("ntext")
                    .HasColumnName("Inhalt_Text");

                entity.Property(e => e.KapitelId).HasColumnName("Kapitel_id");

                entity.HasOne(d => d.Kapitel)
                    .WithMany(p => p.Inhalts)
                    .HasForeignKey(d => d.KapitelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_KapitelInhalt");
            });

            modelBuilder.Entity<Kapitel>(entity =>
            {
                entity.ToTable("Kapitel");

                entity.Property(e => e.KapitelId).HasColumnName("Kapitel_id");

                entity.Property(e => e.KapitelName)
                    .HasMaxLength(100)
                    .HasColumnName("Kapitel_Name");
            });

            modelBuilder.Entity<Rueckmeldung>(entity =>
            {
                entity.HasKey(e => e.RueckId)
                    .HasName("PK__Rueckmel__5F7A8B51FE5C558D");

                entity.ToTable("Rueckmeldung");

                entity.Property(e => e.RueckId).HasColumnName("Rueck_id");

                entity.Property(e => e.AgsId).HasColumnName("AGS_id");

                entity.Property(e => e.RueckText)
                    .HasColumnType("ntext")
                    .HasColumnName("Rueck_Text");

                entity.HasOne(d => d.Ags)
                    .WithMany(p => p.Rueckmeldungs)
                    .HasForeignKey(d => d.AgsId)
                    .HasConstraintName("FK__Rueckmeld__AGS_i__49C3F6B7");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
