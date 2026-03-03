/// Barrel export for all message types used across the SDK.
library core.message.message;

export 'client/client_message.dart';
export 'client/client_message_type.dart';
export 'client/rotation_subcommand.dart';
export 'client/scalar_subcommand.dart';
export 'client/vector_subcommand.dart';
export 'client/client_device_output_command.dart';
export 'client/client_device_command_value.dart';

export 'endpoint.dart';
export 'feature_type.dart';
export 'input_type.dart';
export 'server/server_message.dart';
export 'output_type.dart';
export 'input_cmd_type.dart';

// New in spec 4.0
export 'v4/input_cmd.dart';
export 'v4/output_cmd.dart';
export 'v4/checked_output_cmd.dart';
export 'v4/checked_input_cmd.dart';

/// A tuple of (position, duration) for linear movement.
typedef LinearInfo = (int position, int duration);
