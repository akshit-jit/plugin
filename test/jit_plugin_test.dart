import 'package:flutter_test/flutter_test.dart';
import 'package:jit_plugin/jit_plugin.dart';
import 'package:jit_plugin/jit_plugin_platform_interface.dart';
import 'package:jit_plugin/jit_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJitPluginPlatform
    with MockPlatformInterfaceMixin
    implements JitPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  String getString() {
    // TODO: implement getString
    throw UnimplementedError();
  }
}

void main() {
  final JitPluginPlatform initialPlatform = JitPluginPlatform.instance;

  test('$MethodChannelJitPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJitPlugin>());
  });

  test('getPlatformVersion', () async {
    JitPlugin jitPlugin = JitPlugin();
    MockJitPluginPlatform fakePlatform = MockJitPluginPlatform();
    JitPluginPlatform.instance = fakePlatform;

    expect(await jitPlugin.getPlatformVersion(), '42');
  });
}
