import { SelectableValue, TimeOption } from '@grafana/data';

export const quickOptions: TimeOption[] = [
  { from: 'now-1h', to: 'now', display: '-1h' },
  { from: 'now-1d', to: 'now', display: '-1d' },
  { from: 'now-2d', to: 'now', display: '-2d' },
  { from: 'now-3d', to: 'now', display: '-3d' },
  { from: 'now-4d', to: 'now', display: '-4d' },
  { from: 'now-7d', to: 'now', display: '-7d' },
  { from: 'now-14d', to: 'now', display: '-14d' },
  { from: 'now-30d', to: 'now', display: '-30d' },
  { from: 'now-90d', to: 'now', display: '-90d' },
  { from: 'now-1y', to: 'now', display: '-1y' },
];

export const monthOptions: Array<SelectableValue<number>> = [
  { label: 'Januar', value: 0 },
  { label: 'Februar', value: 1 },
  { label: 'März', value: 2 },
  { label: 'April', value: 3 },
  { label: 'Mai', value: 4 },
  { label: 'Juni', value: 5 },
  { label: 'Juli', value: 6 },
  { label: 'August', value: 7 },
  { label: 'September', value: 8 },
  { label: 'Oktober', value: 9 },
  { label: 'November', value: 10 },
  { label: 'Dezember', value: 11 },
];
