return {
    'AntonVanAssche/date-time-inserter.nvim',
    version = '*',
    lazy = false,

    -- Usage:
    --
    -- :InsertDate [FORMAT] [OFFSET] [TIMEZONE]
    -- Arguments:
    --
    -- FORMAT: strftime-style date format, or a preset name (from your config).
    -- Default: uses the configured default format.
    -- Example: %Y-%m-%d, iso, short, etc.
    -- OFFSET: Relative date adjustment.
    -- Examples: +3d → 3 days ahead, -1w → 1 week ago, +1y-2m → 1 year forward, 2 months back.
    -- Units: d (days), w (weeks), m (months), y (years).
    -- TIMEZONE: Adjusts for a specific timezone (optional).
    -- Default: local system timezone.
    -- Examples: UTC+2, GMT-3, EST, CET.

    opts = {
        -- date_format = '%d-%m-%Y',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- date_time_separator = ' at ',
        date_time_separator = ' ',
        presets = { iso = "%Y-%m-%dT%H:%M:%S" },
    }
}
