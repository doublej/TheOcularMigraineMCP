<script lang="ts">
  let {
    checked = $bindable(false),
    label = '',
    description = '',
    disabled = false,
    onchange,
  }: {
    checked?: boolean
    label?: string
    description?: string
    disabled?: boolean
    onchange?: (checked: boolean) => void
  } = $props()
</script>

<label class="toggle" class:disabled>
  <div class="toggle-text">
    {#if label}<span class="toggle-label">{label}</span>{/if}
    {#if description}<span class="toggle-desc">{description}</span>{/if}
  </div>
  <button
    role="switch"
    aria-checked={checked}
    aria-label={label}
    {disabled}
    class="toggle-switch"
    class:on={checked}
    onclick={() => { if (!disabled) { checked = !checked; onchange?.(checked) } }}
  >
    <span class="toggle-thumb"></span>
  </button>
</label>

<style>
  .toggle {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 14px;
    padding: 12px 0;
    cursor: pointer;
  }

  .toggle.disabled {
    opacity: 0.35;
    pointer-events: none;
  }

  .toggle-text {
    display: flex;
    flex-direction: column;
    gap: 2px;
    min-width: 0;
  }

  .toggle-label {
    font-size: 15px;
    font-weight: 500;
    color: var(--text);
  }

  .toggle-desc {
    font-size: 13px;
    color: var(--text-muted);
  }

  .toggle-switch {
    position: relative;
    width: 52px;
    height: 28px;
    background: var(--border);
    border: 1px solid var(--border);
    border-radius: 6px;
    cursor: pointer;
    flex-shrink: 0;
    transition: all var(--duration) var(--ease-out);
  }

  .toggle-switch.on {
    background: var(--primary);
    border-color: var(--primary);
    box-shadow: 0 0 12px rgba(34, 217, 142, 0.25);
  }

  .toggle-thumb {
    position: absolute;
    top: 3px;
    left: 3px;
    width: 20px;
    height: 20px;
    background: var(--text);
    border-radius: 4px;
    transition: transform var(--duration) var(--ease-spring);
  }

  .toggle-switch.on .toggle-thumb {
    transform: translateX(24px);
    background: #080a10;
  }
</style>
