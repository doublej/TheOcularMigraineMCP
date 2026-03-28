<script lang="ts">
  import type { Snippet } from 'svelte'

  let { title = '', status }: { title?: string; status?: Snippet } = $props()
</script>

<header class="header">
  <div class="header-mark">
    <svg viewBox="0 0 20 20" fill="none">
      <circle cx="10" cy="10" r="8" stroke="currentColor" stroke-width="1.5" opacity="0.3"/>
      <circle cx="10" cy="10" r="3" fill="var(--primary)"/>
    </svg>
  </div>
  <h1>{title}</h1>
  {#if status}
    <div class="header-status">
      {@render status()}
    </div>
  {/if}
</header>

<style>
  .header {
    height: var(--header-height);
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0 18px;
    flex-shrink: 0;
  }

  .header-mark {
    width: 24px;
    height: 24px;
    color: var(--text-muted);
    flex-shrink: 0;
  }

  .header-mark svg {
    width: 100%;
    height: 100%;
  }

  h1 {
    font-family: var(--font-display);
    font-size: 18px;
    font-weight: 600;
    color: var(--text);
    letter-spacing: -0.01em;
  }

  .header-status {
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 10px;
    font-family: var(--font-mono);
    font-size: 12px;
    color: var(--text-secondary);
    flex-shrink: 0;
  }
</style>
