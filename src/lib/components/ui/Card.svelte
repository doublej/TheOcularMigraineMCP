<script lang="ts">
  import type { Snippet } from 'svelte'

  let { title = '', children }: { title?: string; children: Snippet } = $props()
</script>

<div class="card">
  {#if title}
    <h3 class="card-title">{title}</h3>
  {/if}
  <div class="card-body">
    {@render children()}
  </div>
</div>

<style>
  .card {
    background: var(--surface);
    border: 1px solid var(--border-subtle);
    border-radius: var(--radius-lg);
    box-shadow:
      inset 0 1px 0 rgba(255, 255, 255, 0.02),
      0 2px 8px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    position: relative;
  }

  .card::before {
    content: '';
    position: absolute;
    inset: 0;
    opacity: 0.018;
    pointer-events: none;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
    background-size: 128px 128px;
  }

  .card-title {
    font-family: var(--font-display);
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.12em;
    color: var(--text-muted);
    padding: 16px 18px 0;
  }

  .card-body {
    padding: 14px 18px 18px;
  }
</style>
