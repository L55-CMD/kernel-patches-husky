# kernel-patches-husky

Patch stack for the husky (Pixel 8 Pro / zuma) kernel manifest.
Derived from kernel-patches-tegu; zumapro/tegu-specific patches were replaced
with their zuma/shusky equivalents.

- `aosp/*.patch`: patches applied to `kernel/common` (GKI) - AppArmor, halium defconfig, bluetooth
- `build/kernel/*.patch`: patches applied to `kernel/build` (kleaf defconfig fragment support,
  flattened DLKM `etc/` copy fix)
- `private/devices/*.patch`: patches applied to `private/devices`
  (disable prebuilt GKI, vendor_dlkm flatten image, shusky halium support)
- `private/google-modules/*.patch`: patches applied to `private/google-modules`
  (Mali GPU PID-namespace lookup fix)

Apply from the repo checkout root with:

```bash
kernel-patches/apply-patches.sh
```
